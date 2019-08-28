using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Senai.Ekips.WebApi.Repositories;

namespace Senai.Ekips.WebApi.Controllers
{
    [Route("api/[controller]")]
    [Produces("application/json")]
    [ApiController]
    public class FuncionariosController : ControllerBase
    {
        FuncionarioRepository FuncionarioRepository = new FuncionarioRepository();

        [Authorize]
        [HttpGet]
        public IActionResult Listar()
        {
            string permissao = HttpContext.User.Claims.First(x => x.Type == ClaimTypes.Role).Value;
            if (permissao == "ADMINISTRADOR")
                return Ok(FuncionarioRepository.Listar());
            else if (permissao == "COMUM")
                return Ok(FuncionarioRepository.BuscarFuncionarioPorUsuario(Convert.ToInt32(HttpContext.User.Claims.First(c => c.Type == JwtRegisteredClaimNames.Jti).Value)));
            else
                return Forbid();
        }
    }
}