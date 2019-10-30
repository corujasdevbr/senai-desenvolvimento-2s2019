using Senai.Books.WebApi.Domains;
using Senai.Books.WebApi.Domains;
using Senai.Books.WebApi.Interfaces;
using System.Collections.Generic;
using System.Linq;

namespace Senai.Books.WebApi.Repositories
{
    public class EditoraRepository : IGeneric<Editoras>
    {
        public List<Editoras> Listar()
        {
            using (BooksContext ctx = new BooksContext())
            {
                return ctx.Editoras.ToList();
            }
        }

    }
}
