using Senai.Ekips.WebApi.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.Ekips.WebApi.Repositories
{
    public class FuncionarioRepository
    {
        public List<Funcionarios> Listar()
        {
            using (EkipsContext ctx = new EkipsContext())
            {
                return ctx.Funcionarios.ToList();
            }
        }

        public Funcionarios BuscarFuncionarioPorUsuario (int id)
        {
            using (EkipsContext ctx = new EkipsContext())
            {
                return ctx.Funcionarios.FirstOrDefault(x => x.Usuario.UsuarioId == id);
            }
        }
    }
}
