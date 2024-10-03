//
//  ViewController.swift
//  boceto_1
//
//  Created by alumno on 9/20/24.
//

import UIKit

class ViewController: UIViewController {
    var cita_para_enviar: Cita = Cita(quien_lo_dijo: "Araña", que_dijo: "Hola")
    var citas_disponibles : GeneradorDeCitas = GeneradorDeCitas()
    
    //@IBOutlet weak var labelcito: UILabel

    override func viewDidLoad() {
        citas_disponibles = GeneradorDeCitas()
        citas_disponibles.generar_citas_falsas()
        super.viewDidLoad()
        
        //actualizar_cantidad()
        // Do any additional setup after loading the view.
        
    }


    @IBSegueAction func al_abrir_pantalla_de_citas(_ coder: NSCoder) -> ControladorPantallaCitas? {
        return ControladorPantallaCitas(cita_para_citar:citas_disponibles.obtener_cita_aleatoria(), coder: coder)
    }

    
    @IBAction func volver_pantalla_inicio(segue: UIStoryboardSegue) {
        if let pantalla_agregar_citas = segue.source as? ControladorPantallaAgregarCita {
            if let citaCreada = pantalla_agregar_citas.cita_creada {
                citas_disponibles.agregar_cita(citaCreada)
            } else {
                print("cita_creada es nil")
            }
        }
    }

}

