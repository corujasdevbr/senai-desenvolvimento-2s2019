using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Senai.ManualPecas.WebApi.Interfaces;
using Senai.ManualPecas.WebApi.Repositories;

namespace Senai.ManualPecas.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PecasController : ControllerBase
    {
        private IPecasRepository PecasRepository { get; set; }

        public PecasController()
        {
            PecasRepository = new PecaRepository();
        }





    }
}