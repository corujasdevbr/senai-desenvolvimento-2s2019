using System;
using System.Collections.Generic;

namespace Senai.Books.WebApi.Domains
{
    public partial class Editoras
    {
        public Editoras()
        {
            Livros = new HashSet<Livros>();
        }

        public int EditoraId { get; set; }
        public string Nome { get; set; }

        public ICollection<Livros> Livros { get; set; }
    }
}
