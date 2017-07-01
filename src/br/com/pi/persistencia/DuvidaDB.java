package br.com.pi.persistencia;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

import com.thoughtworks.xstream.XStream;

import br.com.pi.dominio.Duvida;

public class DuvidaDB {
	private static String caminho = Conexao.CAMINHO;
    
    private static ArrayList<Duvida> lista = new ArrayList<Duvida>();
    
    public static boolean inserir(Duvida duvidas){
        lerXml();
        
        duvidas.setCodigo(lista.size()+1);
        
        lista.add(duvidas);
        salvarXml();
        
        return true;
    }
    
    public static boolean alterar(Duvida duvida){
        lerXml();
        excluir(duvida.getCodigo());
        inserir(duvida);
        salvarXml();
        
        return true;
    }
    
    public static void excluir(int codigo){
        lerXml();
        for(int i=0; i < lista.size(); i++){
        	Duvida alu = lista.get(i);
            if (alu.getCodigo()==codigo){
                lista.remove(i);
            }
        }
        salvarXml();
    }
    
    public static ArrayList<Duvida> listar(){     
        lerXml();
        return lista;
    }
    
    private static void lerXml(){
        File arquivo=new File(caminho + "duvidas.xml");
        if (arquivo.exists()){
            XStream xstream=new XStream();
            xstream.alias("duvida",Duvida.class);
            lista = (ArrayList<Duvida>) xstream.fromXML(arquivo);
        }else{
            lista = new ArrayList<Duvida>();
        }
    }
    
    private static void salvarXml(){
        XStream xstream = new XStream();
        xstream.alias("duvida",Duvida.class);
        try{
            FileWriter escritor=new FileWriter(caminho + "duvidas.xml");
            escritor.write( xstream.toXML(lista) );
            escritor.close();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public static Duvida getByCodigo(int codigo){
        lerXml();
        Duvida duvidaEncontrada = null;
        for(int i=0; i < lista.size(); i++){
        	Duvida cadaDuvida = lista.get(i);
        	
            if (cadaDuvida.getCodigo()==codigo){
            	duvidaEncontrada = cadaDuvida;
                break;
            }
        }
        return duvidaEncontrada;
    }
    
    public static ArrayList<Duvida> getByCliente(String cpf){
        lerXml();
        ArrayList<Duvida> duvidaEncontrada = new ArrayList<Duvida>();
        for(int i=0; i < lista.size(); i++){
        	Duvida cadaDuvida = lista.get(i);
        	
            if (cadaDuvida.getCliente().equals(cpf)){
            	duvidaEncontrada.add(cadaDuvida);
            }
        }
        return duvidaEncontrada;
    }
}
