using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace ConsoleApplication1{
    class jugador{
           private String nombre;
           private int monto;


        public string Nombre{
            get{
                return nombre;
            }
            set{
                nombre = value;
            }
        }

        public int Monto{
            get{
                return monto;
            }
            set{
                monto = value;
            }
        }
    }
}
