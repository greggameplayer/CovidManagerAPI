import {inject} from '@loopback/core';
import {DefaultCrudRepository, HasOneRepositoryFactory} from '@loopback/repository';
import {MySqlDataSource} from '../datasources';
import {Vaccine, VaccineRelations, Vial} from '../models';

export class VaccineRepository extends DefaultCrudRepository<
  Vaccine,
  typeof Vaccine.prototype.idVaccine,
  VaccineRelations
> {

  public readonly vial: HasOneRepositoryFactory<Vial, typeof Vaccine.prototype.idVaccine>;

  constructor(
    @inject('datasources.MySQL') dataSource: MySqlDataSource,
  ) {
    super(Vaccine, dataSource);
  }
}
