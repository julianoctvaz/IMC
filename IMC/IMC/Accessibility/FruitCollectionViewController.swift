//
//  FruitCollectionViewController.swift
//  IMC
//
//  Created by Juliano on 03/04/25.
//


import UIKit

//✅ Quando vale a pena usar UIViewController em vez dos controllers especializados?
//
//Use UIViewController quando:
//Você precisa mais controle sobre o layout (ex: colocar botões, labels, outras views fora da tabela/coleção).
//Você quer integrar vários componentes na mesma tela, não só uma lista.
//Você prefere construir tudo com ViewCode.

class FruitCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var fruits = ["Banana", "Maçã", "Laranja", "Abacaxi", "Melancia"]

    init() {
        let layout = UICollectionViewFlowLayout()
        //Esse layout organiza os itens em linhas e colunas, tipo um grid, rolando vertical ou horizontalmente!!!
        layout.itemSize = CGSize(width: 150, height: 80)
//        Define o tamanho de cada célula (item) na coleção.
//        Nesse caso, cada célula vai ter 150 pontos de largura e 80 pontos de altura.
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        Define o espaçamento externo (margens) ao redor de cada seção
        super.init(collectionViewLayout: layout)
/*        cria a collection view com esse layout de grid que eu montei aqui em cima.
        
        Margem de 20pt
        +---------------------------+
        |      [150x80] [150x80]   |
        |      [150x80] [150x80]   |
        +---------------------------+
        Margem de 20pt

        Se quiser customizar ainda mais, em alguma parte ai... colcoar:

        minimumLineSpacing → espaçamento entre linhas
        minimumInteritemSpacing → entre colunas
        scrollDirection = .horizontal → vira carrossel
        */
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(FruitCell.self, forCellWithReuseIdentifier: "FruitCell")
        title = "Frutas"
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruits.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FruitCell", for: indexPath) as! FruitCell
        let fruit = fruits[indexPath.item]
        cell.configure(with: fruit)
        return cell
    }

    // MARK: - Context Menu para ações como excluir (acessível via VoiceOver)

    override func collectionView(_ collectionView: UICollectionView,
                                 contextMenuConfigurationForItemAt indexPath: IndexPath,
                                 point: CGPoint) -> UIContextMenuConfiguration? {

        let fruit = fruits[indexPath.item]

        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let delete = UIAction(title: "Excluir",
                                  image: UIImage(systemName: "trash"),
                                  attributes: .destructive) { _ in
                print("🗑️ Excluindo \(fruit)")
                self.fruits.remove(at: indexPath.item)
                collectionView.deleteItems(at: [indexPath])
            }

            return UIMenu(title: "Ações", children: [delete])
        }
    }
}

class FruitCell: UICollectionViewCell {

    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemYellow
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true

        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }

    func configure(with fruit: String) {
        label.text = fruit

        // Acessibilidade: tornar a célula inteira acessível
        isAccessibilityElement = true
        accessibilityLabel = "Fruta: \(fruit)"
        accessibilityHint = "Toque duas vezes e deslize para cima ou para baixo para mais opções"
        accessibilityTraits = .button
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    FruitCollectionViewController()
}
