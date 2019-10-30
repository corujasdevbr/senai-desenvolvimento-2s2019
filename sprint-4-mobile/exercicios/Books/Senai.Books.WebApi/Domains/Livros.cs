using System;
using System.Collections.Generic;

namespace Senai.Books.WebApi.Domains
{
    public partial class Livros
    {
        public int LivroId { get; set; }
        public string Nome { get; set; }
        public string Autor { get; set; }
        public int? Genero { get; set; }
        public int? Editora { get; set; }

        public Editoras EditoraNavigation { get; set; }
        public Generos GeneroNavigation { get; set; }
    }
}
