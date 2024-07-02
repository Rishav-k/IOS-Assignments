import UIKit
import SnapKit

class CustomTableCell: UITableViewCell {
    // Properties
    static let ID = "CustomTableCell"
    
    // UI Components
    var titleLabel = UILabel()
    var yearLabel = UILabel()
    var posterView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addAllSubviews()
        setupPosterView()
        setupTitleLabel()
        setupYearLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Populate cell using API-fetched movie data
    func set(movie: Movie) {
        titleLabel.text = movie.title
        yearLabel.text = movie.year
        posterView.load(url: movie.poster) // async load poster image from URL
    }
    
    // Populate cell using Core Data movie basic info object
    func set(CDMovie: CDMovieBasicInfo) {
        titleLabel.text = CDMovie.titleUnwrapped
        yearLabel.text = CDMovie.yearUnwrapped
        posterView.load(url: CDMovie.posterURLUnwrapped)
    }
    
    func addAllSubviews() {
        contentView.addSubview(posterView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(yearLabel)
    }
    
    func setupPosterView() {
        posterView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.layoutMarginsGuide.snp.leading)
            make.centerY.equalTo(contentView.layoutMarginsGuide.snp.centerY)
            make.height.equalTo(contentView.layoutMarginsGuide.snp.height)
            make.width.equalTo(posterView.snp.height).multipliedBy(2.0/3.0)
        }
        posterView.contentMode = .scaleAspectFit
        posterView.backgroundColor = .secondaryLabel
        posterView.layer.borderWidth = 2
        posterView.layer.borderColor = UIColor.secondaryLabel.cgColor
    }
    
    func setupTitleLabel() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterView.snp.trailing).offset(10)
            make.trailing.equalTo(contentView.layoutMarginsGuide.snp.trailing)
            make.top.equalTo(contentView.layoutMarginsGuide.snp.top).offset(10)
            make.bottom.lessThanOrEqualTo(yearLabel.snp.top)
        }
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.numberOfLines = 2
        titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupYearLabel() {
        yearLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalTo(contentView.layoutMarginsGuide.snp.trailing)
            make.bottom.lessThanOrEqualTo(contentView.layoutMarginsGuide.snp.bottom)
        }
        yearLabel.textColor = .secondaryLabel
    }
}
