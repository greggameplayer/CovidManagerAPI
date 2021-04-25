import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {MySqlDataSource} from '../datasources';
import {Vaccine, VaccineRelations} from '../models';

export class VaccineRepository extends DefaultCrudRepository<
  Vaccine,
  typeof Vaccine.prototype.idVaccine,
  VaccineRelations
> {

  constructor(
    @inject('datasources.MySQL') dataSource: MySqlDataSource,
  ) {
    super(Vaccine, dataSource);
  }
}
