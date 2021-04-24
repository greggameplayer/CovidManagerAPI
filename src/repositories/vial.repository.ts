import {inject, Getter} from '@loopback/core';
import {
  DefaultCrudRepository,
  repository,
  HasOneRepositoryFactory,
} from '@loopback/repository';
import {MySqlDataSource} from '../datasources';
import {Vial, VialRelations, Vaccine, Slot} from '../models';
import {VaccineRepository} from './vaccine.repository';
import {SlotRepository} from './slot.repository';

export class VialRepository extends DefaultCrudRepository<Vial,
  typeof Vial.prototype.idVial,
  VialRelations> {

  public readonly vaccine: HasOneRepositoryFactory<Vaccine, typeof Vial.prototype.idVial>;

  public slot: HasOneRepositoryFactory<Slot, typeof Vial.prototype.idVial>;

  constructor(
    @inject('datasources.MySQL') dataSource: MySqlDataSource, @repository.getter('VaccineRepository') protected vaccineRepositoryGetter: Getter<VaccineRepository>, @repository.getter('SlotRepository') protected slotRepositoryGetter: Getter<SlotRepository>,
  ) {
    super(Vial, dataSource);
    slotRepositoryGetter().then((slotRepo) => {
        this.slot = this.createHasOneRepositoryFactoryFor('slot', slotRepositoryGetter);
        this.registerInclusionResolver('slot', this.slot.inclusionResolver);
    },
      (reason) => {
      })

    this.vaccine = this.createHasOneRepositoryFactoryFor('vaccine', vaccineRepositoryGetter);
    this.registerInclusionResolver('vaccine', this.vaccine.inclusionResolver);
  }
}
