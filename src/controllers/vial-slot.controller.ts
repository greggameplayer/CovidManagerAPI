import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,
  patch,
  post,
  requestBody,
} from '@loopback/rest';
import {
  Vial,
  Slot,
} from '../models';
import {VialRepository} from '../repositories';
import {authenticate} from '@loopback/authentication';

@authenticate('jwt')
export class VialSlotController {
  constructor(
    @repository(VialRepository) protected vialRepository: VialRepository,
  ) { }

  @get('/vials/{id}/slot', {
    responses: {
      '200': {
        description: 'Vial has one Slot',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Slot),
          },
        },
      },
    },
  })
  async get(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Slot>,
  ): Promise<Slot> {
    return this.vialRepository.slot(id).get(filter);
  }

  @post('/vials/{id}/slot', {
    responses: {
      '200': {
        description: 'Vial model instance',
        content: {'application/json': {schema: getModelSchemaRef(Slot)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Vial.prototype.idVial,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Slot, {
            title: 'NewSlotInVial',
            exclude: ['idSlot'],
            optional: ['idSlot']
          }),
        },
      },
    }) slot: Omit<Slot, 'idSlot'>,
  ): Promise<Slot> {
    return this.vialRepository.slot(id).create(slot);
  }

  @patch('/vials/{id}/slot', {
    responses: {
      '200': {
        description: 'Vial.Slot PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Slot, {partial: true}),
        },
      },
    })
    slot: Partial<Slot>,
    @param.query.object('where', getWhereSchemaFor(Slot)) where?: Where<Slot>,
  ): Promise<Count> {
    return this.vialRepository.slot(id).patch(slot, where);
  }

  @del('/vials/{id}/slot', {
    responses: {
      '200': {
        description: 'Vial.Slot DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Slot)) where?: Where<Slot>,
  ): Promise<Count> {
    return this.vialRepository.slot(id).delete(where);
  }
}
