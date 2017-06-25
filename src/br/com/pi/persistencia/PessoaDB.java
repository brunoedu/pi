package br.com.pi.persistencia;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

import com.thoughtworks.xstream.XStream;

import br.com.pi.dominio.Pessoa;
import dominio.Lider;

public class PessoaDB {
	private static String caminho = Conexao.CAMINHO;
    
    private static ArrayList<Pessoa> lista = new ArrayList<Pessoa>();
    
    public static void inserir(Pessoa pessoa){
        lerXml();
        lista.add(pessoa);
        salvarXml();
    }
    
    public static void alterar(Pessoa pessoa){
        lerXml();
        excluir(pessoa.getCpf());
        inserir(pessoa);
        salvarXml();
    }
    
    public static void excluir(int cpf){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Pessoa pes = lista.get(i);
            if (pes.getCpf()==cpf){
                lista.remove(i);
            }
        }
        salvarXml();
    }
    public static ArrayList<Pessoa> listar(){     
        lerXml();
        return lista;
    }
    
    public static int validar(String email, String senha, String tipo){
        lerXml();
        Pessoa pessoaEncontrada = null;
        for(int i=0; i < lista.size(); i++){
        	Pessoa pes = lista.get(i);
            if (pes.getEmail().equals(email) && pes.getSenha().equals(senha) && pes.getTipo().equals(tipo)){
            	pessoaEncontrada = pes;
                break;
            }
        }
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
    
    public static Pessoa getByCpf(int cpf){
        lerXml();
        Pessoa pessoaEncontrada = null;
        for(int i=0; i < lista.size(); i++){
        	Pessoa cadaPessoa = lista.get(i);
        	
            if (cadaPessoa.getCpf()==cpf){
            	pessoaEncontrada = cadaPessoa;
                break;
            }
        }
        return pessoaEncontrada;
    }
}
