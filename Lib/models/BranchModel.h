#ifndef BRANCHMODEL_H
#define BRANCHMODEL_H

#include <qqml.h>
#include <QSqlQueryModel>
#include <QColor>
#include <QBrush>

class BranchModel : public QSqlQueryModel
{
    Q_OBJECT
    QML_ELEMENT
    QML_ADDED_IN_VERSION(1, 1)

public:
    int rowCount(const QModelIndex & = QModelIndex()) const override
    {
        return 5;
    }

    int columnCount(const QModelIndex & = QModelIndex()) const override
    {
        return 4;
    }

    QVariant data(const QModelIndex &index, int role) const override
    {
        switch (role) {
        case Qt::DisplayRole:
        {
            if(index.row() == 0)
            {
                switch(index.column())
                {
                case 0:
                    return "شهر";
                case 1:
                    return "شعبه";
                case 2:
                    return "توضیحات";
                case 3:
                    return "آدرس";
                }
            }


            return
                QString("%1, %2").arg(index.column()).arg(index.row());
        }
        default:
            break;
        }

        return QVariant();
    }

    QHash<int, QByteArray> roleNames() const override
    {
        return { {Qt::DisplayRole, "display"} };
    }
};


#endif // BRANCHMODEL_H
