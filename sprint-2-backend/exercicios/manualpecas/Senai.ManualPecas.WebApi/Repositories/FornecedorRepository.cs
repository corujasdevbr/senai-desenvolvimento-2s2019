using Microsoft.EntityFrameworkCore;
using Senai.ManualPecas.WebApi.Domains;
using Senai.ManualPecas.WebApi.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.ManualPecas.WebApi.Repositories
{
    public class FornecedorRepository : IFornecedorRepository
    {
        public void Cadastrar(Fornecedores fornecedor)
        {
            using (ManualPecasContext ctx = new ManualPecasContext())
            {
                ctx.Fornecedores.Add(fornecedor);
                ctx.SaveChanges();
            }
        }

        public List<Fornecedores> ListaMaisBaratos(int id)
        {
            using (ManualPecasContext ctx = new ManualPecasContext())
            {
                var pecaId = new SqlParameter("id", id);
                return ctx.Fornecedores.FromSql("EXEC prListaMaisBarato @id", pecaId).ToList();
            }
        }
    }
}
