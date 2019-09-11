using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Senai.ManualPecas.WebApi.Interfaces;
using Senai.ManualPecas.WebApi.Repositories;
using Senai.ManualPecas.WebApi.ViewModels;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;

namespace Senai.ManualPecas.WebApi.Controllers
{
    [Route("api/[controller]")]
    [Produces("application/json")]
    [ApiController]
    public class PecasController : ControllerBase
    {
        private IPecasRepository PecasRepository { get; set; }

        public PecasController()
        {
            PecasRepository = new PecaRepository();
        }


        [Authorize]
        [HttpPost]
        public IActionResult Cadastrar(PecaViewModel peca)
        {
            peca.FornecedorId = Convert.ToInt32(HttpContext.User.Claims.First(x => x.Type == JwtRegisteredClaimNames.Jti).Value);
            PecasRepository.Cadastrar(peca);
            return Ok();
        }

    }
}