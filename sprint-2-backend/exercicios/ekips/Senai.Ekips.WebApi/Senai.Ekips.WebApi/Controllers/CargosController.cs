using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Senai.Ekips.WebApi.Domains;
using Senai.Ekips.WebApi.Repositories;

namespace Senai.Ekips.WebApi.Controllers
{
    [Route("api/[controller]")]
    [Produces("application/json")]
    [ApiController]
    [Authorize]
    public class CargosController : ControllerBase
    {

        CargoRepository CargoRepository = new CargoRepository();

        [HttpGet]
        public IActionResult Listar()
        {
            try
            {
                return Ok(CargoRepository.Listar());
            }
            catch (Exception ex)
            {
                return BadRequest(new { mensagem = ex.Message });
            }
        }

        [HttpGet("{id}")]
        public IActionResult BuscarPorId(int id)
        {
            try
            {
                Cargos cargoBuscado = CargoRepository.BuscarPorId(id);
                if (cargoBuscado == null)
                    return NotFound();
                return Ok(cargoBuscado);
            }
            catch (Exception ex)
            {
                return BadRequest(new { mensagem = ex.Message });
            }
        }

        [HttpPost]
        public IActionResult Cadastrar(Cargos cargo)
        {
            try
            {
                CargoRepository.Cadastrar(cargo);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(new { mensagem = ex.Message });
            }
        }

        [HttpPut("{id}")]
        public IActionResult Atualizar(int id, Cargos cargo)
        {
            try
            {
                Cargos cargoBuscado = CargoRepository.BuscarPorId(id);
                if (cargoBuscado == null)
                    return NotFound();
                cargo.CargoId = id;
                CargoRepository.Atualizar(cargo);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(new { mensagem = ex.Message });
            }
        }
    }
}