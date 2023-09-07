package br.com.techgold.teste;

import br.com.techgold.dao.FuncionarioDao;

public class TesteDb {
	
	public static void main(String[] args) {
		
//		Funcionario f = new Funcionario();
//		f.setNome("Anderson");
//		f.setUsuario("aas");
//		f.setSenha("asadcds");
//		FuncionarioDao dao = new FuncionarioDao();
//		dao.salvar(f);
//		
//		
		FuncionarioDao daoExcluir = new FuncionarioDao();
		daoExcluir.excluiFuncionarioPorId(9L);
//		FuncionarioDao dao2 = new FuncionarioDao();
//		if(dao2.listaFuncionario().size() == 0){
//			System.out.println("sem funcionario");
//		}else {
//			System.out.println("existe funcionario");
//		}
		
	}

}
