package M_Modelo;

import M_Util.Elomac;

public class Funcionario extends Elomac{
	public  Funcionario ( ){ 
		super("Funcionario");
	}
        
        public boolean RegistrarFuncionario(String[] fun){
            return (boolean)this.Registar(Group(fun,'~'), 2);
        }
}