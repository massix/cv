// vi: tw=80 colorcolumn=80,120,200 ts=2 sw=2

#import "@preview/fontawesome:0.1.1": *
#import "@preview/modern-cv:0.2.0": *
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
      "Coding Architect",
      "DevOps Engineer",
      "Software Engineer",
      "Opensource Passionate",
    )
  ),
  date: datetime.today().display(),
  accent_color: xcolor.brick-red
)

#let mkGithubLink(repo) = {
  link("https://github.com/massix/" + repo, fa-icon("github", fa-set: "Brands"))
}

// The main template uses "Source Sans Pro", for which the license is not
// compatible with what I would like to achieve. Let's use Source Sans 3
// instead, which is more open and freely distributable.
#set text(font: ("Source Sans 3"))

#align(center, text(size: 6pt, [
  Compiled with Typst #sys.version, binary distributed under the terms of the
  BSD 3-clauses license. Sources available #mkGithubLink("cv")
]))

// Let's start with the keywords

= Main professional skills

#resume-skill-item("dev", (
  "Java (8+)",
  [#fa-heart() Haskell],
  "Purescript",
  "C/C++",
  "Javascript",
  "Typescript (fp-ts)",
  "Lua",
  "Nix"
))

#resume-skill-item("cloud&paas", (
  [#fa-heart() Azure],
  "Kubernetes",
  "Openshift",
  "Docker",
  "Docker Swarm",
  "Portainer",
  "OpenFaaS"
))

#resume-skill-item("conf&provisioning", (
  "Ansible",
  "Vagrant",
  "Puppet"
))

#resume-skill-item("iac", (
  "Terraform",
  [#fa-code-branch() OpenTofu],
  "Bicep",
  "Pulumi",
  "ARM"
))

#resume-skill-item("ci/cd", (
  "GitLab CI",
  "Bitbucket Pipelines",
  "GitHub Actions",
  "Droid"
))

#resume-skill-item("gnu/linux", (
  [#fa-heart() NixOS],
  "Debian",
  "RHEL",
  "CentOS",
  "Gentoo",
  "Arch (btw)"
))

#resume-skill-item("other os", (
  "Android (Termux/Dalvik)",
  "FreeBSD",
  "OpenDarwin",
  "HaikuOS",
  "WinNT"
))

#resume-skill-item("langs", (
  "Italian",
  "French (fluent)",
  "English (advanced)",
  "Quenya (studying)",
  "Toki Pona"
))

#resume-skill-item("misc", (
  [#fa-heart() Neovim],
  "Helix",
  "Typst"
))


= Education

#resume-entry(
  title: "B.S. in Computer Science",
  location: "Alma Mater Studiorum - Bologna",
  date: "2006 - 2011",
  description: [
    Specialization in Operating Systems' Development and virtualization.
  ]
)

#resume-item[
  - #text([#strong([ShockVM]): #mkGithubLink("shockvm") #emph([ShockVM, is an
    Heterogeneous Online Cluster of KVM Virtual Machines]), developed in 2010,
    the project explored the idea of making it possible to spawn a cluster of
    interconnected virtual machines through a Web based interface using KVM and
    VDE as system technologies. Fun fact: I love recursive acronyms.])
  - #text([#strong([KayaOS]): #mkGithubLink("kayaos") a full-fledged Operating
    System for MIPS v1 architectures, for educational purposes and compatible
    with
    #link("https://wiki.virtualsquare.org/#/education/umps")[$mu$mps 2 and 3]])
]

= Professional Experience

// CloudNative

#resume-entry(
  title: "Head of CloudNative Tribe",
  location: "ALTEN SA",
  date: "July 2023 - ongoing",
  description: [
    Coding Architect, Technical Leader, Senior DevOps Engineer
  ]
)

#resume-item[
  - #text([Responsible of studying, coordinating and delivering high risk and
    high commitment projects based on *Cloud* (public or on-premise)
    technologies on behalf of ALTEN International.])
  - #text([Working directly with the commercial department and customers to
    *define the best strategy to deliver a project*, taking into consideration
    the level of commitment and customer's satisfaction.])
  - #text([Managing first contacts with potential new customers, definition of
    the functional perimeter of the project and architectural and technical
    studies, *creation and delivery of the technical documentation*, part of the
    contract's agreement.])
  - #text([Development of *technical proofs of concept*, covering all aspects of
    the development: setup of the infrastructure with IaC technologies and
    development of the technical components of the architecture, using multiple
    languages and frameworks.])
  - #text([*Coaching on new teams*, responsible of validating future evolutions
    on the technical architecture, responsible of the technical quality of the
    project.])
  - #text([Creation, definition and coordination of *internal trainings* on
    Cloud based technologies (IaC, Cloud, ...)])
  - #text([Maintenance and evolution of internal repositories of reusable
    components.])
]

// DCX

#resume-entry(
  title: "Lead Architect for DCX",
  location: "ALTEN SA",
  date: "January 2020 - July 2023",
  description: [
    Coding Architect, Technical Leader, Senior DevOps Engineer
  ]
)

#resume-item[
  - #text([DCX *Digital Customer eXperience* is a brand new department created
    in ALTEN Sophia-Antipolis which focuses on delivering high commitment
    projects for final customers.])
  - #text([Development of technical *proofs of concept*, *coaching* on new
    teams.])
  - #text([Responsible of three internship programs, *coordinating* the work of
    nearly *30 junior developers* in Marseille, Lyon and Sophia Antipolis,
    developing internal libraries and applications to *accelerate the
    development* of CloudNative applications.])
]

#pagebreak()

// Orange Djingo Architect

#resume-entry(
  title: "Orange Djingo / DT Magenta",
  location: "ALTEN SA for Orange and Deutsche Telekom",
  date: "July 2018 - January 2020",
  description: [
    Coding Architect, Senior DevOps Engineer
  ]
)

#resume-item[
  - #text([Part of a six *architects international team* , leading the technical
    governance of Djingo, a vocal assistant similar to Amazon Alexa and Google
    Home.])
  - #text([*Technical Leader* for Java 8+ and Python 3.6 $mu$services.])
  - #text([Full *Cloud based architecture* (Microsoft Azure and Openshift).])
  - #text([Supervising the *deployment and run* of one third of the overall
    architecture of the project])
  - #text([*Head and coach* of the _SuperMario Feature Team_, developing
    $mu$services for IoT interaction.])
  - #text([Coordination with the _Orange Home_ team for definition of used APIs
    and needs.])
]

// Orange Djingo LT

#resume-entry(
  title: "Orange Djingo / DT Magenta",
  location: "ALTEN SA for Orange and Deutsche Telekom",
  date: "January 2016 - July 2018",
  description: [
    Technical Leader, Senior Developer
  ]
)

#resume-item[
  - #text([Experienced Java 8+ developer, leading the _SuperMario Feature Team_,
    of developing the $mu$services for household equipments.])
  - #text([Helping the Product Owner and Project Managers in *defining the
    technical solutions* for the functional requirements.])
  - #text([*Team coaching*, responsible of the technical quality of the
    delivered products.])
]

// Orange Misc

#resume-entry(
  title: "Multiple R&D and Innovation Projects",
  location: "ALTEN SA for Orange France",
  date: "July 2014 - January 2016",
  description: [
    Developer, DevOps Engineer
  ]
)

#resume-item[
  - #text([Member of the *virtual Cloud team*, a team made up of only passionate
    developers willing to spend some of their spare time working on *modern
    cloud technologies*, developing proofs of concept. Development of a Docker
    interceptor in Python to implement a RBAC system on top of Docker Swarm, to
    host different applications on the same cluster, with segregation of
    responsibilities.])
  - #text([Single handedly deployed a *primitive FaaS solution* for an internal
    project using Docker, spawning on-demand containers based on incoming REST
    APIs intercepted by a Java/Spring backend.])
  - #text([Took part in the very first steps of the migration from Docker Swarm
    to *Kubernetes*.])
  - #text([Introduced *Elasticsearch* as an alternative to an internal indexing
    solution for the #link("https://lemoteur.fr")[lemoteur search engine].])
  - #text([Migration of part of KE (Knowledge Engine) from C98 to C++11.])
]

// Amadeus

#resume-entry(
  title: "TPF Developer",
  location: "ALTEN SA for Amadeus",
  date: "March 2012 - July 2014",
  description: [
    IBM HLASM Junior Developer
  ]
)

#resume-item[
  - #text([Maintenance of the legacy TPF system, based on *High-Level Assembly*
    (IBM Specification) on a z/OS Mainframe.])
  - #text([Migration of some modules from ASM to C.])
  - #text([Working with the rest of the team in migrating the legacy system to a
    modern solution based on *GNU/Linux* (SUSE) and C++.])
]

// Projects

= Currently ongoing Opensource Projects

#resume-entry(
  title: "Hwedis",
  location: github-link("massix/hwedis"),
  date: "Since November 2023",
  description: [
    Redis cache multiplexer
  ]
)

#resume-item[
  Used as the base of one of the internship programs in ALTEN, the main idea is
  to intercept the calls to a Redis server and distribute the information about
  the availability of the objects in the cache to avoid useless ping-pongs.
]

#resume-entry(
  title: "Purescript Testcontainers",
  location: github-link("massix/purescript-testcontainers"),
  date: "Since December 2023",
  description: [
    High-level wrapper for Testcontainers, in Purescript and JS FFI
  ]
)

#resume-item[
  The wrapper uses Monads to isolate the execution environment of the containers
  and to allow developers to easily interact with a running container. The
  library will be soon published on Pursuit and be available on the official
  channel.
]

#resume-entry(
  title: "AndiRPG",
  location: github-link("massix/andirpg"),
  date: "Since January 2024",
  description: [
    Nethack inspired game, developed in low-level C.
  ]
)

#resume-item[
  A videogame for nostalgic people, developed entirely on my smartphone using
  Termux, Neovim, clangd and Android NDK. More of an hobbyist geek project than
  something serious.
]

#resume-entry(
  title: "NixOS Contributor and Maintainer",
  location: github-link("nixos/nixpkgs"),
  date: "Summer 2023 - Ongoing",
  description: [
    Proud member of the NixOS Maintainers.
  ]
)

// Personal Interests

= Personal Interests

#resume-item[
  In no particular order: I love spending time with my beloved partner, our
  beautiful cat and our friends. I enjoy practicing Beach Volley and going at
  the gym, trying to stay fit despite the time moving forward faster than I'd
  like to admit. I am a big supporter of Rimini Football Club, practically since
  I was born and probably even sometime before. I do sympathize for FC
  Internazionale and Bologna FC. I love boardgames, wargames, videogames and
  basically everything ending in "games". And, of course, Opensource.
]

