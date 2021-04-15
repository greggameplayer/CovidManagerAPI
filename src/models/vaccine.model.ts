import {Entity, model, property, hasOne} from '@loopback/repository';
import {Vial} from './vial.model';

@model()
export class Vaccine extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  idVaccine?: number;

  @property({
    type: 'string',
    required: true,
  })
  name: string;

  constructor(data?: Partial<Vaccine>) {
    super(data);
  }
}

export interface VaccineRelations {
  // describe navigational properties here
}

export type VaccineWithRelations = Vaccine & VaccineRelations;
