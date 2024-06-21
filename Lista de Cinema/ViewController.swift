//
//  ViewController.swift
//  Lista de Cinema
//
//  Created by user on 20/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textFieldFavorites: UITextField!
    
    @IBOutlet weak var buttonFavorites: UIButton!
    
    @IBOutlet weak var textFieldInteresse: UITextField!
    
    @IBOutlet weak var buttonInteresse: UIButton!
    
    @IBOutlet weak var tituloFavorites: UILabel!
    
    @IBOutlet weak var tituloInteresse: UILabel!
    
    @IBOutlet weak var textViewFavorites: UITextView!
    
    @IBOutlet weak var textViewInteresse: UITextView!
    
    @IBOutlet weak var buttonFecharLista: UIButton!
    
    
    var listaFilmesFavoritos: [String] = []
    
    var listaFilmesInteresse: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Desabilitar os botões inicialmente
        buttonFavorites.isEnabled = false
        buttonInteresse.isEnabled = false
        
        
        textFieldFavorites.addTarget(self, action: #selector(habilitarBotaoFavorites), for: .editingChanged)
        textFieldInteresse.addTarget(self, action: #selector(habilitarBotaoInteresse), for: .editingChanged)
                
    }
    
    @IBAction func adicionarFilmesFavoritos(_ sender: Any) {
        // Código para adicionar filmes favoritos
        if let text = textFieldFavorites.text, !text.isEmpty{
            
            listaFilmesFavoritos.append(text)
            
            textFieldFavorites.text = ""
            buttonFavorites.isEnabled = false

        }
    }
    
    @IBAction func adicionarFilmesInteresse(_ sender: Any) {
        // Código para adicionar filmes de interesse
        if let text = textFieldInteresse.text, !text.isEmpty {
            listaFilmesInteresse.append(text)
            
            textFieldInteresse.text = ""
            buttonInteresse.isEnabled = false
        }
        
    }
    
    
    @IBAction func exibirListas(_ sender: UIButton?) {
        // Caso a lista não esteja vazia, este techo faz com que a lista de filmes favoritos apareça, senão, não aparece.
        if let textView = textViewFavorites {
            if !listaFilmesFavoritos.isEmpty{
                tituloFavorites.alpha = 1.0
                textViewFavorites.alpha = 1.0
                buttonFecharLista.alpha = 1.0
                
                textViewFavorites.text = ""
                
                var textoLista = ""
                
                for listaFavoritos in listaFilmesFavoritos {
                    textoLista += listaFavoritos + "\n"
                }
                
                textViewFavorites.text = textoLista
                
            }
            
        } else {
            textViewFavorites.alpha = 0.0
            tituloFavorites.alpha = 0.0
        }
        
        // Caso a lista não esteja vazia, este techo faz com que a lista de filmes de interesse apareça, senão, não aparece.
        if let textView = textViewInteresse {
            if !listaFilmesInteresse.isEmpty{
                tituloInteresse.alpha = 1.0
                textViewInteresse.alpha = 1.0
                buttonFecharLista.alpha = 1.0
                var textoLista = ""
                
                for listaInteresse in listaFilmesInteresse {
                    textoLista += listaInteresse + "\n"
                }
                
                textViewInteresse.text = textoLista
            }
            
        } else {
            textViewInteresse.alpha = 0.0
            tituloInteresse.alpha = 0.0
        }
        
    }
    
    
    @IBAction func fecharListas(_ sender: Any) {
        textViewFavorites.alpha = 0.0
        tituloFavorites.alpha = 0.0
        textViewInteresse.alpha = 0.0
        tituloInteresse.alpha = 0.0
        buttonFecharLista.alpha = 0.0
    }
    
    @objc func habilitarBotaoFavorites() {
        // Verificação
        buttonFavorites.isEnabled = !textFieldFavorites.text!.isEmpty
    }
    
    @objc func habilitarBotaoInteresse() {
        buttonInteresse.isEnabled = !textFieldInteresse.text!.isEmpty
    }
    
}
