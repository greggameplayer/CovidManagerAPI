import {Entity, model, property} from '@loopback/repository';

@model({
  jsonSchema: {nullable: true}
})
export class Slot extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  idSlot?: number;

  @property({
    type: 'date',
    required: true,
  })
  startTime: string;

  @property({
    type: 'date',
    required: true,
  })
  endTime: string;

  @property({
    type: 'number',
    required: true,
  })
  nbInitialPlaces: number;

  @property({
    type: 'number',
    required: true,
  })
  nbReservedPlaces: number;

  constructor(data?: Partial<Slot>) {
    super(data);
  }
}

export interface SlotRelations {
  // describe navigational properties here
}

export type SlotWithRelations = Slot & SlotRelations;
