//
//  ViewController.swift
//  Lista de Cinema
//
//  Created by Felipe on 20/06/24.
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
        
        // Desabilitar os botões inicialmente
        buttonFavorites.isEnabled = false
        buttonInteresse.isEnabled = false
        
        // Adicionar targets para os textFields
        textFieldFavorites.addTarget(self, action: #selector(habilitarBotao), for: .editingChanged)
        textFieldInteresse.addTarget(self, action: #selector(habilitarBotao), for: .editingChanged)
    }
    
    @IBAction func adicionarFilmesFavoritos(_ sender: Any) {
        // Código para adicionar filmes favoritos
        if let text = textFieldFavorites.text, !text.isEmpty {
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
        // Mostrar lista de filmes favoritos
        if !listaFilmesFavoritos.isEmpty {
            tituloFavorites.alpha = 1.0
            textViewFavorites.alpha = 1.0
            buttonFecharLista.alpha = 1.0
            
            var textoLista = ""
            for listaFavoritos in listaFilmesFavoritos {
                textoLista += listaFavoritos + "\n"
            }
            textViewFavorites.text = textoLista
        } else {
            textViewFavorites.alpha = 0.0
            tituloFavorites.alpha = 0.0
        }
        
        // Mostrar lista de filmes de interesse
        if !listaFilmesInteresse.isEmpty {
            tituloInteresse.alpha = 1.0
            textViewInteresse.alpha = 1.0
            buttonFecharLista.alpha = 1.0
            
            var textoLista = ""
            for listaInteresse in listaFilmesInteresse {
                textoLista += listaInteresse + "\n"
            }
            textViewInteresse.text = textoLista
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
    
    @objc func habilitarBotao() {
        // Verificar e habilitar botão correspondente
        buttonFavorites.isEnabled = !textFieldFavorites.text!.isEmpty
        buttonInteresse.isEnabled = !textFieldInteresse.text!.isEmpty
    }
}
