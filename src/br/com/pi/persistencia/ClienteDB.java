package br.com.pi.persistencia;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

import com.thoughtworks.xstream.XStream;

import br.com.pi.dominio.Cliente;

public class ClienteDB {
    
    private static String caminho = Conexao.CAMINHO;
    
    private static ArrayList<Cliente> lista = new ArrayList<Cliente>();
    
    public static void inserir(Cliente cliente){
        lerXml();
        lista.add(cliente);
        salvarXml();
    }
    
    public static void alterar(Cliente cliente){
        lerXml();
        excluir(cliente.getCodigo());
        inserir(cliente);
        salvarXml();
    }
    
    public static void excluir(int id){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Cliente cli = lista.get(i);
            if (cli.getCodigo() == id){
                lista.remove(i);
            }
        }
        salvarXml();
    }
    public static ArrayList<Cliente> listar(){     
        lerXml();
        return lista;
    }
    
    public static String validar(String email, String senha){
        /*lerXml();
        Cliente clienteEncontrado = null;
        for(int i=0; i < lista.size(); i++){
        	Cliente cli = lista.get(i);
            if (cli.getEmail().equals(email) && cli.getCodigo().equals(senha)){
                clienteEncontrado = cli;
                break;
            }
        }
        return clienteEncontrado;*/
    	
    	return "12345";
    }
    
    private static void lerXml(){
        File arquivo=new File(caminho + "clientes.xml");
        if (arquivo.exists()){
            XStream xstream=new XStream();
            xstream.alias("cliente",Cliente.class);
            lista = (ArrayList<Cliente>) xstream.fromXML(arquivo);
        }else{
            lista = new ArrayList<Cliente>();
        }
    }
    
    private static void salvarXml(){
        XStream xstream = new XStream();
        xstream.alias("cliente",Cliente.class);
        try{
            FileWriter escritor=new FileWriter(caminho + "clientes.xml");
            escritor.write( xstream.toXML(lista) );
            escritor.close();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}
