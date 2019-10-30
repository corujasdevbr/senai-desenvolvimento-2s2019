using Senai.Books.WebApi.Domains;
using Senai.Books.WebApi.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.Books.WebApi.Repositories
{
    public class GeneroRepository : IGeneric<Generos>
    {
        public List<Generos> Listar()
        {
            using (BooksContext ctx = new BooksContext())
            {
                return ctx.Generos.ToList();
            }
        }

    }
}
