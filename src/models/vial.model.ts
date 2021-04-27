import {Entity, model, property, hasOne} from '@loopback/repository';
import {Vaccine} from './vaccine.model';
import {Slot} from './slot.model';

@model({
  jsonSchema: {
    nullable: true
  }
})
export class Vial extends Entity {
  @property({
    type: 'number',
    required: true,
  })
  shotNumber: number;

  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  idVial?: number;

  @property({
    type: 'number',
  })
  idSlot?: number;

  @property({
    type: 'number',
    required: true,
  })
  idVaccine: number;

  @hasOne(() => Vaccine, {keyTo: 'idVaccine', keyFrom: 'idVaccine'})
  vaccine: Vaccine;

  @hasOne(() => Slot, {keyTo: 'idSlot', keyFrom: 'idSlot'})
  slot?: Slot;

  constructor(data?: Partial<Vial>) {
    super(data);
  }
}

export interface VialRelations {
  vaccine: Vaccine;
  slot?: Slot;
}

export type VialWithRelations = Vial & VialRelations;
