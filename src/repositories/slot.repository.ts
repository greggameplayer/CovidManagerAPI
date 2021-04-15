import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, HasOneRepositoryFactory} from '@loopback/repository';
import {MySqlDataSource} from '../datasources';
import {Slot, SlotRelations, Vial} from '../models';
import {VialRepository} from './vial.repository';

export class SlotRepository extends DefaultCrudRepository<
  Slot,
  typeof Slot.prototype.idSlot,
  SlotRelations
> {

  public readonly vial: HasOneRepositoryFactory<Vial, typeof Slot.prototype.idSlot>;

  constructor(
    @inject('datasources.MySQL') dataSource: MySqlDataSource, @repository.getter('VialRepository') protected vialRepositoryGetter: Getter<VialRepository>,
  ) {
    super(Slot, dataSource);
    this.vial = this.createHasOneRepositoryFactoryFor('vial', vialRepositoryGetter);
  }
}
