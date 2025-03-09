// vi: tw=80 colorcolumn=80,120,200 ts=2 sw=2

#import "@preview/modern-cv:0.7.0": *
#import "@preview/splash:0.3.0": xcolor

#show: resume.with(
  author: (
    firstname: "Massimo",
    lastname: "Gengarelli",
    email: "@GH_SECRET_EMAIL@",
    phone: "@GH_SECRET_PHONE@",
    github: "massix",
    linkedin: "@GH_SECRET_LINKEDIN@",
    address: "@GH_SECRET_ADDRESS@",
    positions: (
      "Platform Engineer",
      "Coding Architect",
      "Software Developer",
      "Opensource Passionate",
    )
  ),
  date: datetime.today().display(),
  accent-color: xcolor.brick-red
)

#let mkGithubLink(repo) = {
  link("https://github.com/massix/" + repo, fa-icon("github"))
}

// The main template uses "Source Sans Pro", for which the license is not
// compatible with what I would like to achieve. Let's use Source Sans 3
// instead, which is more open and freely distributable.
#set text(font: "Source Sans 3")

// Start with the keywords

= Skills

#resume-skill-item("cloud", (
  [#fa-heart() Kubernetes],
  "Openshift",
  "Azure",
  "Docker (swarm)"
))

#resume-skill-item("iac", (
  [#fa-heart() Terraform],
  "Ansible",
  "Bicep",
  [#fa-heart() Flux CD],
  "GitLab CI",
  "GitHub Actions",
))

#resume-skill-item("dev", (
  "Java",
  "Typescript",
  "Golang",
  [#fa-heart() Gleam],
  "Lua",
  "Nix"
))

#resume-skill-item("gnu/linux", (
  [#fa-heart() NixOS],
  "Debian",
  "RHEL",
  "Arch (btw)",
))

#resume-skill-item("langs", (
  "Italian",
  "French (fluent)",
  "English (advanced)"
))

// Then a short presentation

= About me

#resume-item([I am committed to continuous learning and skill enhancement, both
  as a developer and as a human being. My passion lies in *development*,
  *open-source* and *cloud architectures*. My curiosity drives me towards new
  technologies, with a particular *fondness for functional programming* and its
  principles, keeping a constant eye on scalable and reliable architectures. In
  my spare time I try to be as active as possible in the opensource world,
  contributing to the projects I personally use. Natural team player, I am
  *ready to help* in any way I can, and I am not scared of seeking for help
  myself.])

= Professional Experience

// Questel

#resume-entry(
  title: "Platform Engineer in Systeam",
  location: "Questel IP",
  date: "Aug 2024 - Ongoing",
  description: [
    Senior DevOps Engineer for On-Premise infrastructures
  ]
)

#resume-item[
  - #text([Automation of Kubernetes Clusters creation using *Tanzu*, *Flux CD*,
    *ytt*, *Cluster APIs* and *GitLab* within our datacenters.])
  - #text([Clusters are pre-configured with sane defaults: *RBAC with Pinniped*,
    *Falcon Operator*, *GPU Operator*, *Trident CSI*, *LGTM stack*, *Vault
    Operator*.])
  - #text([Creation of *Terraform modules* to ease the creation of IaaS-like
    infrastructures in vSphere.])
  - #text([Brought *GitOps* mindset within the team.])
  - #text([Developed *Kubernetes Operator* to handle updates to internal DNS
    records.])
  - #text([Developed *Kubernetes Operator* to upload `kubeconfig` files to
    internal HashiCorp Vault upon cluster creation.])
]

// CloudNative

#resume-entry(
  title: "Lead Cloud Architect of CloudNative Tribe",
  location: "ALTEN SA",
  date: "Jan 2020 - Aug 2024",
  description: [
    Coding Architect, Technical Leader
  ]
)

#resume-item[
  - #text([Successfully led the development and delivery of 10+ high-risk and
    high commitment projects with *Cloud* technologies, in *event-driven* and
    *CQRS* architectures using mainly: *Java* and *Typescript* as development
    languages; *Terraform*, *Helm* and *GitlabCI* for the CI/CD and deployment;
    and finally the *Azure services* (*Kubernetes* and *Event Hub/Kafka* being
    the most used) for the runtime.])
  - #text([*Coordination and animation* of the _CloudNative Tribe_, focusing on
    development of internal reusable softwares with the aim of having fun with
    new technologies in safe environments while learning how to use them in
    production. Projects were developed using mainly *Haskell*, *Rust*,
    *Golang* and *Swift*.])
  - #text([*1-1 mentoring* for colleagues willing to learn more about
    CloudNative development and deployment. Successfully tutored a total of 30
    students and followed 4 consultants in their career path.])
  - #text([Achieved and maintained an average of *90% code coverage* for the
    backend and *70% code coverage* for the frontend for all the projects.])
]

// Orange Djingo Architect

#resume-entry(
  title: "Orange Djingo / DT Magenta",
  location: "ALTEN SA / Orange France / Deutsche Telekom",
  date: "Jan 2016 - Jan 2020",
  description: [
    Coding Architect, Senior Software Engineer
  ]
)

#resume-item[
  - #text([Part of an *international team* of six architects, leading the
    technical governance of Djingo, a cloud based vocal assistant.])
  - #text([*Technical Leader* for a scrum team of 7 *Java* and *Python 3.6*
    developers. Part of a 120 developers *SAFe* organization.])
  - #text([*DevOps Engineer* for the scrum team, managing the deployment with
    *Ansible* and *Gitlab CI* of the 10 $mu$services developed by the team, part
    of a cloud architecture based on *Microsoft Azure* and *Openshift* and
    composed of more than 80 $mu$services.])
  - #text([Responsible of the technical quality of the delivered products,
    managed to reach and maintain the goal of *90% code coverage* in our
    components.])
]

// Orange Misc

#resume-entry(
  title: "R&D and Innovation Projects",
  location: "ALTEN SA / Orange France",
  date: "Jul 2014 - Jan 2016",
  description: [
    Developer, DevOps Engineer
  ]
)

#resume-item[
  - #text([Participated in the development of a *Docker* interceptor in *Python*
    to implement a RBAC system on top of *Docker Swarm*, to host different
    applications on the same cluster, with segregation of responsibilities.])
  - #text([Single handedly deployed a *primitive FaaS solution* for an internal
    project using *Docker*, spawning on-demand containers based on incoming REST
    APIs intercepted by a *Java/Spring* backend.])
  - #text([Participated in the migration of an internal indexing search engine
    to *Elasticsearch* for the #link("https://lemoteur.fr")[lemoteur search
    engine].])
  - #text([Migration of part of KE (Knowledge Engine) from C98 to *C++11*.])
]

// Amadeus

#resume-entry(
  title: "TPF Developer",
  location: "ALTEN SA / Amadeus",
  date: "Mar 2012 - Jul 2014",
  description: [
    IBM HLASM Junior Developer
  ]
)

#resume-item[
  - #text([Maintenance of the legacy TPF system, based on *High-Level Assembly*
    (IBM Specification) on a z/OS Mainframe.])
  - #text([Migration of 20+ modules from *ASM* to *C*.])
  - #text([Working with the rest of the team in migrating the legacy system to a
    modern solution based on *GNU/Linux* (SUSE) and *C++*.])
]

// Education

= Education

#resume-entry(
  title: "B.S. in Computer Science",
  location: "Alma Mater Studiorum - Bologna",
  date: "Nov 2011",
  description: [
    Specialization in Operating Systems' Development and Virtualisation.
  ]
)

#resume-item[
  Successfully completed the studies with a final grade of 105/110.
  - #text([#strong([ShockVM]): #mkGithubLink("shockvm") #emph([ShockVM, is an
    Heterogeneous Online Cluster of KVM Virtual Machines]). The project explored
    the idea of spawning a cluster of interconnected virtual machines through a
    Web based interface using KVM and VDE as system technologies. Fun fact: I
    love recursive acronyms.])
]


// Hobbies and Projects

= Interests

#resume-item[
  In my spare time I do enjoy writing software, my
  #link("https://github.com/massix")[GitHub Account] is the living proof of how
  much I love experimenting. I am a *proud maintainer and contributor* of the
  #link("https://github.com/nixos/nixpkgs")[*NixOS Linux Distribution*], for
  which I maintain some derivations and rewrote the way Electron applications
  are packaged.

  I enjoy practicing Beach Volley and going at the gym, trying to stay fit
  despite the time moving forward faster than I'd like to admit. I am a big
  supporter of Rimini Football Club, practically since I was born and probably
  even sometime before. I do sympathize for FC Internazionale and Bologna FC.
  I love boardgames, wargames, videogames and basically everything ending in
  "games". And, of course, Opensource.
]

