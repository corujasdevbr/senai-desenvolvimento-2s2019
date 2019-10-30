using Senai.Books.WebApi.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.Books.WebApi.Interfaces
{
    interface IGeneric<T>
    {
        List<T> Listar();
    }
}
