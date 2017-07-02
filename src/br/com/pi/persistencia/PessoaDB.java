package br.com.pi.persistencia;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

import com.thoughtworks.xstream.XStream;

import br.com.pi.dominio.Pessoa;
import br.com.pi.dominio.Veiculo;

public class PessoaDB {
	private static String caminho = Conexao.CAMINHO;
    
    private static ArrayList<Pessoa> lista = new ArrayList<Pessoa>();
    
    public static boolean inserir(Pessoa pessoa){
        lerXml();

        boolean pessoaEncontrada = false;
        for(int i=0; i < lista.size(); i++){
        	Pessoa pes = lista.get(i);
            if (pes.getCpf().equals(pessoa.getCpf()) || pes.getEmail().equals(pessoa.getEmail())){
            	pessoaEncontrada = true;
                break;
            }
        }
        
        if(!pessoaEncontrada){
	        lista.add(pessoa);
	        salvarXml();
        }
        
        return pessoaEncontrada;
    }
    
    public static void alterar(Pessoa pessoa){
        lerXml();
        excluirEditar(pessoa.getCpf());
        inserir(pessoa);
        salvarXml();
    }
    
    public static void excluirEditar(String cpf){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Pessoa pes = lista.get(i);
            if (pes.getCpf().equals(cpf)){
                lista.remove(i);
            }
        }
        salvarXml();
    }
    
    public static boolean excluir(String cpf){
        lerXml();
        
        if(AluguelDB.verifyPessoa(cpf))
        	return false;
        

        if(DuvidaDB.verifyPessoa(cpf))
        	return false;
        
        for(int i=0; i < lista.size(); i++){
            Pessoa pes = lista.get(i);
            if (pes.getCpf().equals(cpf)){
                lista.remove(i);
            }
        }
        salvarXml();
        
        return true;
    }
    
    public static ArrayList<Pessoa> listar(){     
        lerXml();
        return lista;
    }
    
    public static String validar(String email, String senha, String tipo){
        lerXml();
        Pessoa pessoaEncontrada = null;
        for(int i=0; i < lista.size(); i++){
        	Pessoa pes = lista.get(i);
            if (pes.getEmail().equals(email) && pes.getSenha().equals(senha) && pes.getTipo().equals(tipo)){
            	pessoaEncontrada = pes;
                break;
            }
        }
        if(pessoaEncontrada==null)
        	return "false";
        
        return pessoaEncontrada.getCpf();
    }
    
    private static void lerXml(){
        File arquivo=new File(caminho + "pessoas.xml");
        if (arquivo.exists()){
            XStream xstream=new XStream();
            xstream.alias("pessoa",Pessoa.class);
            lista = (ArrayList<Pessoa>) xstream.fromXML(arquivo);
        }else{
            lista = new ArrayList<Pessoa>();
        }
    }
    
    private static void salvarXml(){
        XStream xstream = new XStream();
        xstream.alias("pessoa",Pessoa.class);
        try{
            FileWriter escritor=new FileWriter(caminho + "pessoas.xml");
            escritor.write( xstream.toXML(lista) );
            escritor.close();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public static Pessoa getByCpf(String cpf){
        lerXml();
        Pessoa pessoaEncontrada = null;
        for(int i=0; i < lista.size(); i++){
        	Pessoa cadaPessoa = lista.get(i);
        	
            if (cadaPessoa.getCpf().equals(cpf)){
            	pessoaEncontrada = cadaPessoa;
                break;
            }
        }
        return pessoaEncontrada;
    }
    

    public static ArrayList<Pessoa> getAllByTipo(String tipo){
        lerXml();
        ArrayList<Pessoa> listaByTipo = new ArrayList<Pessoa>();
        for(int i=0; i < lista.size(); i++){
        	Pessoa cadaPessoa = lista.get(i);        	
            if (cadaPessoa.getTipo().equals(tipo)){
            	listaByTipo.add(cadaPessoa);
            }
        }
        return listaByTipo;
    }
}
