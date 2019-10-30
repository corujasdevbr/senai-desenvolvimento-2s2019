using Microsoft.EntityFrameworkCore;
using Senai.Books.WebApi.Domains;
using Senai.Books.WebApi.Interfaces;
using System.Collections.Generic;
using System.Linq;

namespace Senai.Books.WebApi.Repositories
{
    public class LivroRepository : IGeneric<Livros>
    {
        public List<Livros> Listar()
        {
            using (BooksContext ctx = new BooksContext())
            {
                return ctx.Livros
                    .Include(x => x.EditoraNavigation)
                    .Include(x => x.GeneroNavigation)
                    .ToList();
            }
        }
    }
}
