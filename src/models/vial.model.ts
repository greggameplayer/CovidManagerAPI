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

  @hasOne(() => Vaccine, {keyTo: 'idVaccine'})
  vaccine: Vaccine;

  @hasOne(() => Slot, {keyTo: 'idSlot'})
  slot: Slot;

  constructor(data?: Partial<Vial>) {
    super(data);
  }
}

export interface VialRelations {
  vaccine: Vaccine;
}

export type VialWithRelations = Vial & VialRelations;
