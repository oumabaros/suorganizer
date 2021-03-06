# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0002_post_data'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='startups',
            field=models.ManyToManyField(related_name='blog_posts', blank=True, to='organizer.Startup'),
        ),
        migrations.AlterField(
            model_name='post',
            name='tags',
            field=models.ManyToManyField(related_name='blog_posts', blank=True, to='organizer.Tag'),
        ),
    ]
