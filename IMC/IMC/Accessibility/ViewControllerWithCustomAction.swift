    //
    //  ViewControllerWithCustomAction.swift
    //  IMC
    //
    //  Created by Juliano on 03/04/25.
    //


    import UIKit

    //Exemplo com UIAccessibilityCustomActions (UIKit)

// Lembrando que a gente está focando na reproducao auditiva! Nao visual!

    //
    // O que é essas acoes customizadas?
    //São ações personalizadas que o VoiceOver oferece quando o usuário faz swipe para cima/baixo num elemento.
    //
    //Você pode criar ações como:
    //“Marcar como favorito”
    //“Compartilhar”
    //“Excluir”

    // Para TESTAR:
    //Rode no simulador com VoiceOver ativado (Cmd + Triplo Clique ou pelas config de Acessibilidade).
    //Dê foco na view amarela → swipe para cima/baixo → ações disponíveis.

    class ViewControllerWithCustomAction: UIViewController {
        
        // MARK: - Properties

        private let accessibleView: UIView = {
            let view = UIView()
            view.backgroundColor = .systemYellow
            view.isAccessibilityElement = true
            view.accessibilityLabel = "Imagem do quadro amarelo"
            view.accessibilityHint = "Toque duas vezes para abrir"
            view.accessibilityTraits = [.image]
            return view
        }()

        // MARK: - Life Cycle
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            setupLayout()

            // Adicionando ações extras para VoiceOver (CUSTOMIZADAS)
            let favoriteAction = UIAccessibilityCustomAction(name: "Marcar como favorito", target: self, selector: #selector(markAsFavorite))
            let deleteAction = UIAccessibilityCustomAction(name: "Excluir", target: self, selector: #selector(deleteItem))

            accessibleView.accessibilityCustomActions = [favoriteAction, deleteAction]
        }

        // MARK: - UI
        
        private func setupLayout() {
            view.addSubview(accessibleView)
            accessibleView.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                accessibleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                accessibleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                accessibleView.widthAnchor.constraint(equalToConstant: 200),
                accessibleView.heightAnchor.constraint(equalToConstant: 200)
            ])
        }
        // MARK: - Actions

        @objc func markAsFavorite() -> Bool {
            print("🐱 Marcado como favorito") // ver no console
            accessibleView.backgroundColor = .systemPink
            return true
        }

        @objc func deleteItem() -> Bool {
            print("🗑️ Item excluído") // ver no console
            accessibleView.backgroundColor = .lightGray
            return true
        }
    }

    #Preview {
        ViewControllerWithCustomAction()
    }
