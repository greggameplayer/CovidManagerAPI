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
  Vaccine,
} from '../models';
import {VialRepository} from '../repositories';

export class VialVaccineController {
  constructor(
    @repository(VialRepository) protected vialRepository: VialRepository,
  ) { }

  @get('/vials/{id}/vaccine', {
    responses: {
      '200': {
        description: 'Vial has one Vaccine',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Vaccine),
          },
        },
      },
    },
  })
  async get(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Vaccine>,
  ): Promise<Vaccine> {
    return this.vialRepository.vaccine(id).get(filter);
  }

  @post('/vials/{id}/vaccine', {
    responses: {
      '200': {
        description: 'Vial model instance',
        content: {'application/json': {schema: getModelSchemaRef(Vaccine)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Vial.prototype.idVial,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Vaccine, {
            title: 'NewVaccineInVial',
            exclude: ['idVaccine'],
            optional: ['idVaccine']
          }),
        },
      },
    }) vaccine: Omit<Vaccine, 'idVaccine'>,
  ): Promise<Vaccine> {
    return this.vialRepository.vaccine(id).create(vaccine);
  }

  @patch('/vials/{id}/vaccine', {
    responses: {
      '200': {
        description: 'Vial.Vaccine PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Vaccine, {partial: true}),
        },
      },
    })
    vaccine: Partial<Vaccine>,
    @param.query.object('where', getWhereSchemaFor(Vaccine)) where?: Where<Vaccine>,
  ): Promise<Count> {
    return this.vialRepository.vaccine(id).patch(vaccine, where);
  }

  @del('/vials/{id}/vaccine', {
    responses: {
      '200': {
        description: 'Vial.Vaccine DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Vaccine)) where?: Where<Vaccine>,
  ): Promise<Count> {
    return this.vialRepository.vaccine(id).delete(where);
  }
}
