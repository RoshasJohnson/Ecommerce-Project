# Generated by Django 4.0.2 on 2022-02-24 06:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0004_alter_category_category_offer_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='status',
            field=models.CharField(choices=[('Packed', 'Packed'), ('Delivered', 'Delivered'), ('Canceled', 'Canceled'), ('Return', 'Return')], default='Processing', max_length=100),
        ),
    ]