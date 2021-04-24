import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository} from '@loopback/repository';
import {MySqlDataSource} from '../datasources';
import {Slot, SlotRelations} from '../models';
import {VialRepository} from './vial.repository';

export class SlotRepository extends DefaultCrudRepository<
  Slot,
  typeof Slot.prototype.idSlot,
  SlotRelations
> {

  constructor(
    @inject('datasources.MySQL') dataSource: MySqlDataSource, @repository.getter('VialRepository') protected vialRepositoryGetter: Getter<VialRepository>,
  ) {
    super(Slot, dataSource);
  }
}
