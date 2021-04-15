import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getModelSchemaRef,
  patch,
  put,
  del,
  requestBody,
  response,
} from '@loopback/rest';
import {Slot} from '../models';
import {SlotRepository} from '../repositories';

export class SlotController {
  constructor(
    @repository(SlotRepository)
    public slotRepository : SlotRepository,
  ) {}

  @post('/slots')
  @response(200, {
    description: 'Slot model instance',
    content: {'application/json': {schema: getModelSchemaRef(Slot)}},
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Slot, {
            title: 'NewSlot',
            exclude: ['idSlot'],
          }),
        },
      },
    })
    slot: Omit<Slot, 'idSlot'>,
  ): Promise<Slot> {
    return this.slotRepository.create(slot);
  }

  @get('/slots/count')
  @response(200, {
    description: 'Slot model count',
    content: {'application/json': {schema: CountSchema}},
  })
  async count(
    @param.where(Slot) where?: Where<Slot>,
  ): Promise<Count> {
    return this.slotRepository.count(where);
  }

  @get('/slots')
  @response(200, {
    description: 'Array of Slot model instances',
    content: {
      'application/json': {
        schema: {
          type: 'array',
          items: getModelSchemaRef(Slot, {includeRelations: true}),
        },
      },
    },
  })
  async find(
    @param.filter(Slot) filter?: Filter<Slot>,
  ): Promise<Slot[]> {
    return this.slotRepository.find(filter);
  }

  @patch('/slots')
  @response(200, {
    description: 'Slot PATCH success count',
    content: {'application/json': {schema: CountSchema}},
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Slot, {partial: true}),
        },
      },
    })
    slot: Slot,
    @param.where(Slot) where?: Where<Slot>,
  ): Promise<Count> {
    return this.slotRepository.updateAll(slot, where);
  }

  @get('/slots/{id}')
  @response(200, {
    description: 'Slot model instance',
    content: {
      'application/json': {
        schema: getModelSchemaRef(Slot, {includeRelations: true}),
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Slot, {exclude: 'where'}) filter?: FilterExcludingWhere<Slot>
  ): Promise<Slot> {
    return this.slotRepository.findById(id, filter);
  }

  @patch('/slots/{id}')
  @response(204, {
    description: 'Slot PATCH success',
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Slot, {partial: true}),
        },
      },
    })
    slot: Slot,
  ): Promise<void> {
    await this.slotRepository.updateById(id, slot);
  }

  @put('/slots/{id}')
  @response(204, {
    description: 'Slot PUT success',
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() slot: Slot,
  ): Promise<void> {
    await this.slotRepository.replaceById(id, slot);
  }

  @del('/slots/{id}')
  @response(204, {
    description: 'Slot DELETE success',
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.slotRepository.deleteById(id);
  }
}
