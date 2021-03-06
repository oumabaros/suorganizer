from django.db import models
from django.core.urlresolvers import reverse

class Tag(models.Model):
    def __str__(self):
        return self.name.title()
    def get_absolute_url(self):
        return reverse('organizer_tag_detail', kwargs={'slug': self.slug})
        #return reverse('organizer_tag_detail',args=(self.slug,))
    def get_update_url(self):
        return reverse('organizer_tag_update', kwargs={'slug': self.slug})

    def get_delete_url(self):
        return reverse('organizer_tag_delete',kwargs={'slug':self.slug})

    class Meta:
        ordering=['name']
    name=models.CharField(max_length=31,unique=True)
    slug=models.SlugField(max_length=31,unique=True,help_text='A Label for URL config.')

class Startup(models.Model):
    def __str__(self):
        return self.name
    def get_absolute_url(self):
        return reverse('organizer_startup_detail', kwargs={'slug': self.slug})
        #return reverse('organizer_startup_detail',args=(self.slug,))
    def get_update_url(self):
        return reverse('organizer_startup_update', kwargs={'slug': self.slug})

    def get_delete_url(self):
        return reverse('organizer_startup_delete', kwargs={'slug': self.slug})

    class Meta:
        ordering=['name']
        get_latest_by='founded_date'
    name=models.CharField(max_length=31,db_index=True)
    slug=models.SlugField(max_length=31,unique=True,help_text='A Label for URL config.')
    description=models.TextField()
    founded_date=models.DateField('date founded')
    contact=models.EmailField()
    website=models.URLField(max_length=255)
    tags=models.ManyToManyField(Tag,blank=True)

class NewsLink(models.Model):
    def __str__(self):
        return "{}:{}".format(self.startup,self.title)
    class Meta:
        verbose_name='news article'
        ordering=['-pub_date']
        get_latest_by='pub_date'
    def get_absolute_url(self):
        return self.startup.get_absolute_url()

    def get_update_url(self):
        return reverse('organizer_newslink_update',kwargs={'pk':self.pk})

    def get_delete_url(self):
        return reverse('organizer_newslink_delete',kwargs={'pk':self.pk})

    class Meta:
        unique_together = (('slug', 'startup'),)
    title=models.CharField(max_length=63)
    pub_date=models.DateField('date published')
    link=models.URLField(max_length=255)
    startup=models.ForeignKey(Startup)
    slug = models.SlugField(max_length=63)
