package br.com.pi.persistencia;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

import com.thoughtworks.xstream.XStream;

import br.com.pi.dominio.Aluguel;

public class AluguelDB {
	private static String caminho = Conexao.CAMINHO;
    
    private static ArrayList<Aluguel> lista = new ArrayList<Aluguel>();
    
    public static boolean inserir(Aluguel aluguel){
        lerXml();
        
        aluguel.setCodigo(lista.size()+1);
        
        lista.add(aluguel);
        salvarXml();
        
        return true;
    }
    
    public static boolean alterar(Aluguel aluguel){
        lerXml();
        excluir(aluguel.getCodigo());
        inserir(aluguel);
        salvarXml();
        
        return true;
    }
    
    public static void excluir(int codigo){
        lerXml();
        for(int i=0; i < lista.size(); i++){
        	Aluguel alu = lista.get(i);
            if (alu.getCodigo()==codigo){
                lista.remove(i);
            }
        }
        salvarXml();
    }
    
    public static ArrayList<Aluguel> listar(){     
        lerXml();
        return lista;
    }
    
    private static void lerXml(){
        File arquivo=new File(caminho + "alugueis.xml");
        if (arquivo.exists()){
            XStream xstream=new XStream();
            xstream.alias("aluguel",Aluguel.class);
            lista = (ArrayList<Aluguel>) xstream.fromXML(arquivo);
        }else{
            lista = new ArrayList<Aluguel>();
        }
    }
    
    private static void salvarXml(){
        XStream xstream = new XStream();
        xstream.alias("aluguel",Aluguel.class);
        try{
            FileWriter escritor=new FileWriter(caminho + "alugueis.xml");
            escritor.write( xstream.toXML(lista) );
            escritor.close();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public static Aluguel getByCodigo(int codigo){
        lerXml();
        Aluguel aluguelEncontrado = null;
        for(int i=0; i < lista.size(); i++){
        	Aluguel cadaAluguel = lista.get(i);
        	
            if (cadaAluguel.getCodigo()==codigo){
            	aluguelEncontrado = cadaAluguel;
                break;
            }
        }
        return aluguelEncontrado;
    }
    
    public static ArrayList<Aluguel> getByCliente(String cpf){
        lerXml();
        ArrayList<Aluguel> aluguelEncontrado = new ArrayList<Aluguel>();
        for(int i=0; i < lista.size(); i++){
        	Aluguel cadaAluguel = lista.get(i);
        	
            if (cadaAluguel.getCliente().equals(cpf)){
            	aluguelEncontrado.add(cadaAluguel);
            }
        }
        return aluguelEncontrado;
    }
}
