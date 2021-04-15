import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, HasOneRepositoryFactory} from '@loopback/repository';
import {MySqlDataSource} from '../datasources';
import {Vaccine, VaccineRelations, Vial} from '../models';
import {VialRepository} from './vial.repository';

export class VaccineRepository extends DefaultCrudRepository<
  Vaccine,
  typeof Vaccine.prototype.idVaccine,
  VaccineRelations
> {

  public readonly vial: HasOneRepositoryFactory<Vial, typeof Vaccine.prototype.idVaccine>;

  constructor(
    @inject('datasources.MySQL') dataSource: MySqlDataSource, @repository.getter('VialRepository') protected vialRepositoryGetter: Getter<VialRepository>,
  ) {
    super(Vaccine, dataSource);
    this.vial = this.createHasOneRepositoryFactoryFor('vial', vialRepositoryGetter);
  }
}
