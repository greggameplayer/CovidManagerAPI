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
import {Vaccine} from '../models';
import {VaccineRepository} from '../repositories';
import {authenticate} from '@loopback/authentication';

@authenticate('jwt')
export class VaccineController {
  constructor(
    @repository(VaccineRepository)
    public vaccineRepository : VaccineRepository,
  ) {}

  @post('/vaccines')
  @response(200, {
    description: 'Vaccine model instance',
    content: {'application/json': {schema: getModelSchemaRef(Vaccine)}},
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Vaccine, {
            title: 'NewVaccine',
            exclude: ['idVaccine'],
          }),
        },
      },
    })
    vaccine: Omit<Vaccine, 'idVaccine'>,
  ): Promise<Vaccine> {
    return this.vaccineRepository.create(vaccine);
  }

  @get('/vaccines/count')
  @response(200, {
    description: 'Vaccine model count',
    content: {'application/json': {schema: CountSchema}},
  })
  async count(
    @param.where(Vaccine) where?: Where<Vaccine>,
  ): Promise<Count> {
    return this.vaccineRepository.count(where);
  }

  @get('/vaccines')
  @response(200, {
    description: 'Array of Vaccine model instances',
    content: {
      'application/json': {
        schema: {
          type: 'array',
          items: getModelSchemaRef(Vaccine, {includeRelations: true}),
        },
      },
    },
  })
  async find(
    @param.filter(Vaccine) filter?: Filter<Vaccine>,
  ): Promise<Vaccine[]> {
    return this.vaccineRepository.find(filter);
  }

  @patch('/vaccines')
  @response(200, {
    description: 'Vaccine PATCH success count',
    content: {'application/json': {schema: CountSchema}},
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Vaccine, {partial: true}),
        },
      },
    })
    vaccine: Vaccine,
    @param.where(Vaccine) where?: Where<Vaccine>,
  ): Promise<Count> {
    return this.vaccineRepository.updateAll(vaccine, where);
  }

  @get('/vaccines/{id}')
  @response(200, {
    description: 'Vaccine model instance',
    content: {
      'application/json': {
        schema: getModelSchemaRef(Vaccine, {includeRelations: true}),
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Vaccine, {exclude: 'where'}) filter?: FilterExcludingWhere<Vaccine>
  ): Promise<Vaccine> {
    return this.vaccineRepository.findById(id, filter);
  }

  @patch('/vaccines/{id}')
  @response(204, {
    description: 'Vaccine PATCH success',
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Vaccine, {partial: true}),
        },
      },
    })
    vaccine: Vaccine,
  ): Promise<void> {
    await this.vaccineRepository.updateById(id, vaccine);
  }

  @put('/vaccines/{id}')
  @response(204, {
    description: 'Vaccine PUT success',
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() vaccine: Vaccine,
  ): Promise<void> {
    await this.vaccineRepository.replaceById(id, vaccine);
  }

  @del('/vaccines/{id}')
  @response(204, {
    description: 'Vaccine DELETE success',
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.vaccineRepository.deleteById(id);
  }
}
