import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {MySqlDataSource} from '../datasources';
import {Vial, VialRelations} from '../models';

export class VialRepository extends DefaultCrudRepository<
  Vial,
  typeof Vial.prototype.idVial,
  VialRelations
> {
  constructor(
    @inject('datasources.MySQL') dataSource: MySqlDataSource,
  ) {
    super(Vial, dataSource);
  }
}
