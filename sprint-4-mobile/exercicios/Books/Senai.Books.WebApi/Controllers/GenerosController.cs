using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Senai.Books.WebApi.Domains;
using Senai.Books.WebApi.Interfaces;
using Senai.Books.WebApi.Repositories;

namespace Senai.Books.WebApi.Controllers
{
    [Route("api/[controller]")]
    [Produces("application/json")]
    [ApiController]
    public class GenerosController : ControllerBase
    {
        private IGeneric<Generos> GeneroRepository { get; set; }

        public GenerosController()
        {
            GeneroRepository = new GeneroRepository();
        }

        [HttpGet]
        public IActionResult Listar()
        {
            return Ok(GeneroRepository.Listar());
        }


    }
}