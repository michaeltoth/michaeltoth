Title: Projects
Date: 2016-03-13 15:00

I enjoy experimenting with different technologies to create useful and entertaining projects. This page contains a sample of some of the projects I've created. Mostly these are applications created in Javascript and with the Shiny package of the R programming language.  

<style>

ul#project-list {
  list-style-type: none; 
  margin-left: -40px;
  width: 600px;
}

li.project-list-element {
  padding: 10px;
  overflow: auto;
}

li:hover.project-list-element {
  background: #eee;
  cursor: pointer;
}

li.project-list-element img {
  float: left;
  margin: 0 15px 0 0;
}

li.project-list-element h3 {
  margin: 0 0 25px 0;
}

a.list-link {
  color: inherit;
}

</style>

<div>
    <ul id="project-list">
        <li class="project-list-element">
            <a href='./most-common-baby-names-by-year.html' class="list-link">
                <img src='../images/name_popularity_thumb.png' />
                <h3>Birth Name Rankings Since 1880</h3> 
                <p>Here I built a Shiny app for analyzing the 10 most popular baby names (according to U.S. Seocial Security Administration data) for any year since 1880, both for males or females. If you're interested in more context or information about the implementation, please check out my  
<a href='../popularity-of-baby-names-since-1880.html'>blog post!</a></p>
            </a>
        </li>
        <li class="project-list-element">
            <a href='./tracking-popularity-of-individual-names.html' class="list-link">
                <img src='../images/name_tracker_thumb.png' />
                <h3>Birth Name Popularity Since 1880</h3> 
                <p>This is a Shiny app that graphs the popularity of a particular birth name (according to the U.S. Social Security Administration data) beginning in 1880. For more information and a thorough write-up, please check out my <a href='../popularity-of-baby-names-since-1880.html'>blog post!</a></p>
            </a>
        </li>
        <li class="project-list-element">
            <a href='./percolation.html' class="list-link">
                <img src='../images/percolation_thumb.png' />
                <h3>Percolation Problem Visualization</h3> 
                <p>This is a visualizer for a percolation system built upon the union-find algorithm for connectivity. This is a relatively in-depth Javascript project. For more details on the implementation, please check out my <a href='../using-javascript-to-visualize-a-percolation-system.html'>blog post!</a></p>
            </a>
        </li>
        <li class="project-list-element">
            <a href='./mondrian.html' class="list-link">
                <img src='../images/mondrian_thumb.png' />
                <h3>Piet Mondrian Painting</h3> 
                <p>This is implemented with a simple Javascript function that allows the user to select a colors and paint a grid of divs. I created this as one of my earliest projects when I was first learning Javascript, but I still think it's pretty cool!</p>
            </a>
        </li>

    </ul>
</div>
