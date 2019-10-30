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
    public class LivrosController : ControllerBase
    {
        private IGeneric<Livros> LivroRepository { get; set; }

        public LivrosController()
        {
            LivroRepository = new LivroRepository();
        }

        [HttpGet]
        public IActionResult Listar()
        {
            return Ok(LivroRepository.Listar());
        }
    }
}