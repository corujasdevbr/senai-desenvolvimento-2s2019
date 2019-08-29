using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Senai.BookStore.WebApi.Repositories;

namespace Senai.BookStore.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AutoresController : ControllerBase
    {
        AutorRepository AutorRepository = new AutorRepository();

        [HttpGet]
        public IActionResult Listar()
        {
            return Ok(AutorRepository.Listar());
        }
    }
}