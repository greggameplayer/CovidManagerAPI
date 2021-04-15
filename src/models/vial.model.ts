import {Entity, model, property} from '@loopback/repository';

@model()
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
    required: true,
  })
  idVaccine: number;

  @property({
    type: 'number',
    required: true,
  })
  idSlot: number;


  constructor(data?: Partial<Vial>) {
    super(data);
  }
}

export interface VialRelations {
  // describe navigational properties here
}

export type VialWithRelations = Vial & VialRelations;
