package br.com.pi.persistencia;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

import com.thoughtworks.xstream.XStream;

import br.com.pi.dominio.Veiculo;

public class VeiculoDB {
	private static String caminho = Conexao.CAMINHO;
    
    private static ArrayList<Veiculo> lista = new ArrayList<Veiculo>();
    
    public static boolean inserir(Veiculo veiculo){
        lerXml();

        boolean veiculoEncontrado = false;
        for(int i=0; i < lista.size(); i++){
        	Veiculo vei = lista.get(i);
            if (vei.getPlaca().equals(veiculo.getPlaca())){
            	veiculoEncontrado = true;
                break;
            }
        }
        
        if(!veiculoEncontrado){
	        lista.add(veiculo);
	        salvarXml();
        }
        
        return veiculoEncontrado;
    }
    
    public static void alterar(Veiculo veiculo){
        lerXml();
        excluir(veiculo.getPlaca());
        inserir(veiculo);
        salvarXml();
    }
    
    public static void excluir(String placa){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Veiculo vei = lista.get(i);
            if (vei.getPlaca().equals(placa)){
                lista.remove(i);
            }
        }
        salvarXml();
    }
    
    public static ArrayList<Veiculo> listar(){     
        lerXml();
        return lista;
    }
    
    private static void lerXml(){
        File arquivo=new File(caminho + "veiculos.xml");
        if (arquivo.exists()){
            XStream xstream=new XStream();
            xstream.alias("veiculo",Veiculo.class);
            lista = (ArrayList<Veiculo>) xstream.fromXML(arquivo);
        }else{
            lista = new ArrayList<Veiculo>();
        }
    }
    
    private static void salvarXml(){
        XStream xstream = new XStream();
        xstream.alias("veiculo",Veiculo.class);
        try{
            FileWriter escritor=new FileWriter(caminho + "veiculos.xml");
            escritor.write( xstream.toXML(lista) );
            escritor.close();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public static Veiculo getByPlaca(String placa){
        lerXml();
        Veiculo veiculoEncontrado = null;
        for(int i=0; i < lista.size(); i++){
        	Veiculo cadaVeiculo = lista.get(i);
        	
            if (cadaVeiculo.getPlaca().equals(placa)){
            	veiculoEncontrado = cadaVeiculo;
                break;
            }
        }
        return veiculoEncontrado;
    }
}
