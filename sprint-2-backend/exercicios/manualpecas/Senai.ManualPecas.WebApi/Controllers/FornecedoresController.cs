using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Senai.ManualPecas.WebApi.Domains;
using Senai.ManualPecas.WebApi.Interfaces;
using Senai.ManualPecas.WebApi.Repositories;

namespace Senai.ManualPecas.WebApi.Controllers
{
    [Route("api/[controller]")]
    [Produces("application/json")]
    [ApiController]
    public class FornecedoresController : ControllerBase
    {
        private IFornecedorRepository FornecedorRepository { get; set; }

        public FornecedoresController()
        {
            FornecedorRepository = new FornecedorRepository();
        }

        [HttpGet("{id}")]
        public IActionResult ListarMaisBaratos(int pecaId)
        {
            return Ok(FornecedorRepository.ListaMaisBaratos(pecaId));
        }

        [HttpPost]
        public IActionResult Cadastrar(Fornecedores fornecedor)
        {
            try
            {
                FornecedorRepository.Cadastrar(fornecedor);
                return Ok();
            }catch (Exception e){
                return BadRequest(new { mensagem = e });
            }
        }

    }
}