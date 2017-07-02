package br.com.pi.persistencia;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

import com.thoughtworks.xstream.XStream;

import br.com.pi.dominio.Pessoa;
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
    
    public static boolean alterar(Veiculo veiculo){
        lerXml();
        excluirEditar(veiculo.getPlaca());
        boolean alterado = inserir(veiculo);
        salvarXml();
        
        return alterado;
    }
    

    public static void excluirEditar(String placa){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Veiculo vei = lista.get(i);
            if (vei.getPlaca().equals(placa)){
                lista.remove(i);
            }
        }
        salvarXml();
    }
    
    public static boolean excluir(String placa){
        lerXml();
        
        if(AluguelDB.verifyVeiculo(placa))
        	return false;
        
        for(int i=0; i < lista.size(); i++){
            Veiculo vei = lista.get(i);
            if (vei.getPlaca().equals(placa)){
                lista.remove(i);
            }
        }
        salvarXml();
        
        return true;
    }
    
    public static ArrayList<Veiculo> listar(){     
        lerXml();
        ArrayList<Veiculo> veiculosDisponiveis = new ArrayList<Veiculo>();
        for(int i=0; i < lista.size(); i++){
            Veiculo vei = lista.get(i);
            if (vei.getEstadoVeiculo().equals("Em Atividade")){
            	veiculosDisponiveis.add(vei);
            }
        }
        return veiculosDisponiveis;
    }
    
    public static ArrayList<Veiculo> listarFunc(){    
        lerXml();
        ArrayList<Veiculo> veiculosDisponiveis = new ArrayList<Veiculo>();
        for(int i=0; i < lista.size(); i++){
            Veiculo vei = lista.get(i);
            if (!vei.getEstadoVeiculo().equals("Desativado")){
            	veiculosDisponiveis.add(vei);
            }
        }
        return veiculosDisponiveis;
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
