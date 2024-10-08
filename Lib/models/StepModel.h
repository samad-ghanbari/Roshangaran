#ifndef STEPMODEL_H
#define STEPMODEL_H

#include <qqml.h>
//#include <QSqlQueryModel>
#include <QAbstractTableModel>
#include <Lib/database/dbman.h>

class StepModel : public QAbstractTableModel
{
    Q_OBJECT
    QML_ELEMENT
    QML_ADDED_IN_VERSION(1, 1)

public:
    explicit StepModel(DbMan *_dbMan, QObject *parent=NULL)
    {
        dbMan = _dbMan;
    }

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

private:
    DbMan *dbMan;
};

#endif // STEPMODEL_H
