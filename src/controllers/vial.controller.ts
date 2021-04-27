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
import {Vial} from '../models';
import {VialRepository} from '../repositories';

export class VialController {
  constructor(
    @repository(VialRepository)
    public vialRepository : VialRepository,
  ) {}

  @post('/vials')
  @response(200, {
    description: 'Vial model instance',
    content: {'application/json': {schema: getModelSchemaRef(Vial)}},
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Vial, {
            title: 'NewVial',
            exclude: ['idVial'],
          }),
        },
      },
    })
    vial: Omit<Vial, 'idVial'>,
  ): Promise<Vial> {
    return this.vialRepository.create(vial);
  }

  @get('/vials/count')
  @response(200, {
    description: 'Vial model count',
    content: {'application/json': {schema: CountSchema}},
  })
  async count(
    @param.where(Vial) where?: Where<Vial>,
  ): Promise<Count> {
    return this.vialRepository.count(where);
  }

  @get('/vials')
  @response(200, {
    description: 'Array of Vial model instances',
    content: {
      'application/json': {
        schema: {
          type: 'array',
          items: getModelSchemaRef(Vial, {includeRelations: true})
        },
      },
    },
  })
  async find(
    @param.filter(Vial) filter?: Filter<Vial>,
  ): Promise<Vial[]> {
    return this.vialRepository.find(filter);
  }

  @patch('/vials')
  @response(200, {
    description: 'Vial PATCH success count',
    content: {'application/json': {schema: CountSchema}},
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Vial, {partial: true}),
        },
      },
    })
    vial: Vial,
    @param.where(Vial) where?: Where<Vial>,
  ): Promise<Count> {
    return this.vialRepository.updateAll(vial, where);
  }

  @get('/vials/{id}')
  @response(200, {
    description: 'Vial model instance',
    content: {
      'application/json': {
        schema: getModelSchemaRef(Vial, {includeRelations: true}),
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Vial, {exclude: 'where'}) filter?: FilterExcludingWhere<Vial>
  ): Promise<Vial> {
    return this.vialRepository.findById(id, filter);
  }

  @patch('/vials/{id}')
  @response(204, {
    description: 'Vial PATCH success',
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Vial, {partial: true}),
        },
      },
    })
    vial: Vial,
  ): Promise<void> {
    await this.vialRepository.updateById(id, vial);
  }

  @put('/vials/{id}')
  @response(204, {
    description: 'Vial PUT success',
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() vial: Vial,
  ): Promise<void> {
    await this.vialRepository.replaceById(id, vial);
  }

  @del('/vials/{id}')
  @response(204, {
    description: 'Vial DELETE success',
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.vialRepository.deleteById(id);
  }
}
